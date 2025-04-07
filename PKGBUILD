# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-hijridate
pkgver=2.5.0
pkgrel=1
pkgdesc="Accurate Hijri-Gregorian dates converter based on Umm al-Qura calendar"
arch=(any)
url="https://github.com/dralshehri/hijridate"
license=(MIT)
depends=('python' 'python-hatchling' 'python-hatch-fancy-pypi-readme')
makedepends=("python-pip")
build() {
  pip install --no-deps --target="HijriDate" HijriDate==2.5.0
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/HijriDate/* $pkgdir/"$sitepackages"
}
