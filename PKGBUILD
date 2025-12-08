# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Jonas Malaco <jonas@protocubo.io>

_pkgname=vgrep
pkgname=${_pkgname}-bin
pkgver=2.8.0
pkgrel=2
pkgdesc="pager for grep, git-grep, ripgrep and similar, allows for opening the indexed file locations in a user-specified editor"
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')
url="https://github.com/vrothberg/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/vrothberg/${_pkgname}/v${pkgver}"
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64")
source_i686=("${_pkgname}_${pkgver}_i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386")
source_aarch64=("${_pkgname}_${pkgver}_aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2'
            '834bd87a7506e37c7412ce607f05d06aeb1fab14026e66b3f9329202bda0b1d5')
sha256sums_x86_64=('f077e57f1b710d95a1d7431ae30f81fe8867833bb523d042499926c07226ff3f')
sha256sums_i686=('c7fb32e33d579d7a74f64b429863c1137145221e958f7647c33e06ab04359934')
sha256sums_aarch64=('1f67d36151814dacadd121a60f78a80baea4d003370566f7d2233dd07f3c0e44')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}_${pkgver}_${arch}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

