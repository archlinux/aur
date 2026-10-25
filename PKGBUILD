# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-hijridate
_pkgname=hijridate
pkgver=2.6.0
pkgrel=1
pkgdesc="Accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar"
arch=(any)
url="https://github.com/dralshehri/hijridate"
license=(MIT)
depends=('python')
makedepends=("python-build" "python-installer" "python-hatch-fancy-pypi-readme" "python-hatchling")
sha256sums=('afe4644c4d1fe3cfd2aa3c28bfa660405c12e5ba53249ba942ec68c7bb216e00')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")



build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl 
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
