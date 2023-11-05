# Maintainer: Mia Furze <46620osu@gmail.com>

pkgbase=yanu
pkgname=("${pkgbase}-bin" "${pkgbase}-cli-bin")
pkgver=0.10.1
pkgrel=1
pkgdesc="Yet Another NSP Updater for Skyline"
arch=('x86_64')
url=https://github.com/nozwock/yanu
license=('GPL2')
depends=('gcc12' 'libjpeg-turbo' 'binutils' 'icu' 'git' 'make')
source=(
  "${pkgbase}::https://github.com/nozwock/yanu/releases/download/${pkgver}/${pkgbase}-x86_64-unknown-linux-gnu"
  "${pkgbase}-cli::https://github.com/nozwock/yanu/releases/download/${pkgver}/${pkgbase}-cli-x86_64-unknown-linux-musl"
  "${pkgbase}.desktop"
)
sha512sums=('767f6f40b7dce493599e8b7f01a9ee3243a0efde6faa582637a1b3920f2529ed2e9b4a20d5b549c03c2ddffd9f94065ba59f57ea815e0294cb1060a1ab17d3de'
            '112486039cd002dc1a3f8172d0dd6a71ce8dc1b64dfc777c67ec20a196b36973a33e01d7e3fbc2b0515229097d8d843337cc56a4bdb6b27f8554156a2a9548fb'
            '7e241497284246a396e76d58326ecc0d6164549d27a5be6b0ec37131f3e7e65a2c13a8aa97b2f2d2aaa7b2d1de7437c939304293503d35a6af35546d6930ecc7')

package_yanu-bin() {
  provides=('yanu')
  conflicts=('yanu')

  install -Dm644 ${pkgbase} "${pkgdir}/usr/bin/${pkgbase}"
  chmod +x "${pkgdir}/usr/bin/${pkgbase}"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" ${pkgbase}.desktop
}

package_yanu-cli-bin() {
  provides=('yanu-cli')
  conflicts=('yanu-cli')
  pkgdesc+=" - CLI"

  install -Dm644 ${pkgbase}-cli "${pkgdir}/usr/bin/${pkgbase}-cli"
  chmod +x "${pkgdir}/usr/bin/${pkgbase}-cli"
}
