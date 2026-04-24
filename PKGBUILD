pkgname=graphify-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder into a queryable knowledge graph"
arch=(x86_64)
url="https://graphify.net"
license=(MIT)
depends=("python>=3.10" "python" "python-pip")
provides=(graphify)

source=("https://files.pythonhosted.org/packages/source/g/graphifyy/graphifyy-0.5.0.tar.gz")
sha256sums=('cc832c7aaf843fb8b7c6372dc2f0ada705fbdff69a7e54879ac46f914d911bf7')

build() {
    cd "${srcdir}/graphifyy-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/graphifyy-${pkgver}"
    python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/graphify-bin"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/graphify-bin"
}