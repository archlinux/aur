# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=llm4free
pkgname=python-${_name}
pkgver=2026.9.14
pkgrel=1
pkgdesc="Your All-in-One Python Toolkit for Web Search, AI Interaction, Digital Utilities, and More"
arch=(any)
url="https://github.com/OEvortex/llm4free"
license=('APACHE-2.0')
conflicts=('python-webscout')
replaces=('python-webscout')
depends=('python'
    'python-aiohttp'
    'python-colorama'
    'python-curl_cffi'
    'python-html5lib'
    'python-httpx'
    'python-litprinter'
    'python-nest-asyncio'
    'python-openai'
    'python-packaging'
    'python-psutil'
    'python-pydantic'
    'python-pyyaml'
    'python-requests'
    'python-rich'
    'python-tqdm'
    'python-typing_extensions'
  )
makedepends=('python-setuptools' 'python-wheel')
checkdepends=(
  'mypy'
  'python-numpy'
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-mock'
  'python-ruff'
  'vulture'
)
source=(
  "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d0/df/18a971b703f0c3a38bb23b50efb2853089b1969a1cb9013ca2ed6680e583/llm4free-2026.9.14.tar.gz"
  # Patch to fix trio dependency issue from https://github.com/OEvortex/Webscout/pull/82
)
sha256sums=(
  088044bcc11c9b8a98d31b850543a196f01704663131f99a0f2a98790f399b4d
)

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
