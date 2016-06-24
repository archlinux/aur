# StepMania <git: 5_1_0>
#
# Maintainer: GhettoGirl
#
# This theme requires StepMania 5.1.0 alpha 2 or later.
# It won't work for any lower version of StepMania, I tried.
#

pkgname=stepmania-theme-spawncamping-wallhack
_shortname=spawncamping-wallhack
_themeauthor=ca25nada
pkgver=2.0.1.r2.g01daf3b
pkgrel=1
pkgdesc="Yet another StepMania 5 theme with quads all over the place"
arch=('any')
url="https://github.com/ca25nada/spawncamping-wallhack"
license=('custom')
depends=('stepmania>=5.1.0a2')
makedepends=('git')
source=("git+https://github.com/$_themeauthor/$_shortname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_shortname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_shortname"
  
  # Copy all files to package directory
  mkdir -p "$pkgdir/opt/stepmania/Themes/$_shortname"
  cp -r -t "$pkgdir/opt/stepmania/Themes/$_shortname" *
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
