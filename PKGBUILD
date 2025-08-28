# Maintainer: Fabrice Mouhartem (Chouhartem) <aur-packages at epheme dot re>
# Contributor: Filipe Laíns (FFY00) <lains at archlinux dot org>
# Contributor: Hyacinthe Cartiaux < hyacinthe dot cartiaux at free dot fr >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>
# Cloned from: https://gitlab.archlinux.org/archlinux/packaging/packages/python-livereload/-/tree/main
# Notice of removal: https://lists.archlinux.org/archives/list/arch-dev-public@lists.archlinux.org/message/V2IQUDSTZQJRF6AWMGRHYRF37VZFRYX6/
# Reason for putting it in AUR: dependency of `aur/kalamine-git`

_name="livereload"
_module="${_name}"

pkgname="python-${_module}"
pkgver=2.7.1
pkgrel=1
pkgdesc="livereload server in python"
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
depends=("python" "python-six" "python-tornado")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a0c5a316ad5d34518b6ca44cddff51ba45d60a8ba24de767e791aa529e4ab22accf15916321fea755e67f4fd0aecb1e0ed840142662c27c8eaa6cad5dc2a7399')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
