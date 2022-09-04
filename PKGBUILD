# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=2.6
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, fuzzy-finding and more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript bat fzf dunst dialog xsel lolcat)
conflicts=(lfp-git)
optdepends=(
  'git: cloning repos from within lfp'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'afc4cfc10e17630d8b8dab06bd961e74370a8311c1f1c8b456b75f681cd51c3b76afe5f09591698f3ea8bcb24ca80b9c2a3b5dd80a8d46c0ddc10f8de3a00527'
  '9c969bc76168bca08570cb0d20985ff6fbc91b0800a6920153ce0fc1e6e24bbd72ba6199c8d9087c3fbfa2cee021733c8283650bf0ef69b4c783cc8703c9c6d6'
  )
md5sums=(
  '488ae806737007010db777cfdc6ee20a'
  '816d5130464eae9b374b0f3d16c773aa'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
