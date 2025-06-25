# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-hijridate
_pkgname=hijridate
pkgver=2.5.0
pkgrel=1
pkgdesc="Accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar"
arch=(any)
url="https://github.com/dralshehri/hijridate"
license=(MIT)
depends=('python' 'python-hatchling' 'python-hatch-fancy-pypi-readme')
makedepends=("python-pip" "python-build" "python-installer" "python-wheel")
sha256sums=('b47f0b2e5333d5d898c6f3472f5cee4a3f045c82d69c073c7a026f5a7aec5821')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")



build() {
    cd "$_pkgname-$pkgver"
    pwd
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl 
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
