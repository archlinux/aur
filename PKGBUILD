# Maintainer: myl7 <myl@myl.moe>

_pkgname=open-enclave
pkgname="$_pkgname-bin"
pkgver=0.19.4
pkgrel=1
pkgdesc='Open Enclave SDK'
arch=('x86_64')
url='https://openenclave.io/sdk/'
# _giturl='https://github.com/openenclave/openenclave'
# Since it bundles all submodule deps
license=('Apache-2.0')
optdepends=(
  'openssl-1.1: for bundled tools and linked with host part when building'
  'clang14: can build'
)
changelog="$_pkgname.changelog.md"
source=(
  "https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/o/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
  'LICENSES'
)
sha256sums=('e20e03dab90cd3cf7b17d8672bfc6385bd27a7adb9db4ca13ce02a7c4ad26511'
            'a9c03d39d11e672c5f1df92576d8e02ee40c661830c9e759ed90b749193f4970')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  install -D -m644 "$srcdir/LICENSES" "$pkgdir/usr/share/licenses/${pkgname}/LICENSES"
}
