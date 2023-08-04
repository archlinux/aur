# Maintainer: Benjamin Winger <bmw@disroot.org>

_fullver=0.40-pre-release-2
pkgname=tes3cmd
pkgver=0.40_pre2
pkgrel=2
pkgdesc="A command line tool to examine and manipulate plugins for the game Morrowind"
provides=('tes3cmd')
conflicts=('tes3cmd')
arch=(any)
url="https://github.com/john-moonsugar/tes3cmd"
license=(MIT)
depends=('perl')
source=(
  "https://github.com/john-moonsugar/tes3cmd/archive/v$_fullver.tar.gz"
  "https://gitlab.com/portmod/openmw-mods/-/raw/c1570249e87cc23cc5d42a9570a0ce88f7aa2af5/bin/tes3cmd/files/regex.patch"
)
sha512sums=(
  '9ba1919eae8f572cfa58f9f1dccca9b2b2e24f2a0e4182139c3716b49ce645d69782053b70fb407d32dce2beb74068fd23b6fb8e14a276205630ac606edf6ecb'
  '3ebdf98b6188108f9ce847ad617ccdebc4cd03c09ce894c4ca77013e66bee9451a18f02f292d9b242a8590928475e1bc658bbc6ba11820fb33f0c67dd2589eb4'
)

prepare() {
    patch --directory="$pkgname-$_fullver" --forward --strip=1 --input="${srcdir}/regex.patch"
}

package() {
  cd "$pkgname-$_fullver"
  install -Dm 755 tes3cmd -t "${pkgdir}/usr/bin"
}
