# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=gerbolyze
pkgver=3.0.11
pkgrel=2
pkgdesc="A high-resolution image-to-PCB converter"
arch=("any")
url="https://jaseg.de/projects/gerbolyze/"
license=("AGPL-3.0-or-later")
makedepends=("python-setuptools")
depends=("python-pcb-tools-git" "python-tqdm" "python-numpy" "python-opencv")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('06301568531730d948096f9e336c0be11c0d58ed83d84fefa6074ed68c21fd68')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
