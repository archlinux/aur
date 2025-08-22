# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.4.15
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-packaging python-pydantic python-requests python-requests-toolbelt python-zstandard)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langsmith-pyo3 python-openai-agents python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-http python-opentelemetry-sdk python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('755722011f2c4dad45c50b0e016de58dde21895255dea1f1eb476cbe7974d11a47a0831739f1240f89b93d894ade794db8b863c9a66c05e757fbc1980384afc9')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
