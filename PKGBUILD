# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-community
_module='langchain-community'
_src_folder='langchain_community-0.0.17'
pkgver='0.0.17'
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
url="https://github.com/langchain-ai/langchain"
depends=(python
    python-aiohttp
    python-dataclasses-json
    python-langchain-core
    python-langsmith
    python-numpy
    python-yaml
    python-requests
    python-sqlalchemy
    python-tenacity
    python-tiktoken
    python-lxml
    python-steam
    python-google-auth
    python-psycopg2
    python-feedparser
    python-pytube
    python-beautifulsoup4
    python-redis
    python-html2text
    python-pychm
    python-google-auth-oauthlib
    python-scikit-learn
    python-reportlab
    python-pyparsing
    python-websocket-client
    python-google-api-python-client
    python-googleapis-common-protos
    python-pillow
    python-chardet
    python-xmltodict
    python-magic
    python-joblib
    yt-dlp
    python-grpcio
    python-selenium
    python-google-api-core
    python-pygithub
    python-protobuf
    python-pytz
    python-openai
    python-packaging
    python-tqdm
    python-jsonpatch
    python-tomli
    python-typing_extensions
    python-pandas
    python-httpx
    python-langchain
    python-urllib3
    python-psutil
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module/-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/bb7325114629604b00167f00d49e704a7d477d8d/LICENSE")
sha256sums=('ab957b34a562e0199b2ecf050bdc987c4fe889b2ac9f22b75a9fac8b9e30f53a'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
