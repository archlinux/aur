# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=chruby-fish
pkgver=0.8.1+1+d377acb
pkgrel=1
pkgdesc="Thin wrapper around chruby to make it work with the Fish shell"
arch=(any)
url="https://github.com/JeanMertz/chruby-fish"
license=('MIT')
depends=('chruby' 'fish')
install=${pkgname}.install

_commit='d377acbd255f2c2dec8191942d8743ba473e1f7c'
source=("${pkgname}::git+${url}.git#commit=${_commit}"
        chruby-root.patch)
sha256sums=('SKIP'
            '1d8e18fea6d5146e8c8eca59dec89b18c22f0cefedf3b6c9b573e37c8bead820')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 -i ../chruby-root.patch
}

package() {
  cd "${srcdir}/${pkgname}"

  make PREFIX="${pkgdir}/usr" install >/dev/null
}
