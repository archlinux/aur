pkgname=lola-retro
pkgver=1.11.2
pkgrel=1
pkgdesc='CRT shader for RetroArch'
arch=(any)
url=https://github.com/zoran123456/lola-retro
license=('MIT')
makedepends=(git)
source=($pkgname::$url/releases/download/v$pkgver/$pkgname-v$pkgver.zip)
sha256sums=('5902bcc972cc51047316ab46431e27556c960341c2591352a5d4293599984495')

package() {
  install -dm 755 "${pkgdir}"/usr/share/libretro/shaders/shaders_slang
  cp -dr --no-preserve='ownership' "${pkgname}" "${pkgdir}"/usr/share/libretro/shaders/shaders_slang

  # remove LICENSE and markdown files
  find "${pkgdir}"/usr/share/libretro/shaders/shaders_slang/"${pkgname}" -maxdepth 1 -type f -exec rm {} \;
}
