# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-electron-bin
_srcname="vcash-electron"
pkgver=0.33.1
pkgrel=1
pkgdesc="Multi-platform and multi-node GUI for Vcash."
arch=('x86_64')
url="https://github.com/openvcash/vcash-electron"
license=('GPL3' 'AGPL3')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
conflicts=('vcash' 'vcash-electron')
provides=('vcash' 'vcash-electron')
source=("https://github.com/openvcash/vcash-electron/releases/download/v$pkgver/Vcash-Electron-GUI-$pkgver-linux64.zip"
  "vcash-electron.desktop"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/16x16.png"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/32x32.png"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/48x48.png"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/96x96.png"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/128x128.png"
  "https://raw.githubusercontent.com/openvcash/vcash-electron/v$pkgver/build/icons/256x256.png")
sha512sums=('a320ea8ec92f5e1d80034982984bc16b3acb27ae9819d18abb3801c06cef72033ea9084ac050b529ab6101251c6af2195129639fee13663c63d6317479b51089'
  '339a50892e4c4af228e58471d185a9ff014a23efc3a1f45ac4b6880b25d9f1937bd9aa406979d7f21396856637e79d70c46320220786d43ae84dfdf3e6292c1b'
  'ea96f7cc6e095c06f928dd65f40700115127d5a45911b28700b48450f12ba6d3b573e8435d9a3a06f4a8a412d2c06cd8adfb31c967198595276fb63fca990d8f'
  '096a7463c3d93c95a0a6fa09adbfce0ef13768e5b3b0af1a6b374f69770b3d94e5fb4e7b1c2e248794ee5356f5fff664fd53b64075ad7594450699aff4b82789'
  '528599dd891fbb783f67de30b8a3b62515422ce676c952bc827256e76a589401d2dcdc70e5dd4864ff2adceaf591e183e037e5c25d75ad3876a9414f6cb379c7'
  'e8d5e047c9334a662def4cb0ec6e3b7c9221a6da1dcc73bf84c25226960286d13804b9bb5822f7c0c948e166bb5d2d7c7b89a1a7690a01902d36b52573fd742a'
  'da01044c2da03a3695e954c496c2b90e5b677a08592757ec746e8542ce0cf9378f2e94eef6530b8de8dfef66336051f7253a6ba88764b9217b19ebc3a2c6eceb'
  'af8b4689c76bcb65fc928276c83a1fcf11b4cb4f96fa275323bb77a2d9ec8f2ddf47446282cbde6518e4b18781ad41b60ba5892fe37e08b1d24a6deb0fa7ca50')
package() {
  for _size in 16 32 48 96 128 256; do
    install -Dm644 "$srcdir/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/vcash.png"
  done
  install -Dm644 "$srcdir/vcash-electron.desktop" "$pkgdir/usr/share/applications/vcash-electron.desktop"
  mkdir -p "$pkgdir"/usr/{lib,bin}
  mv "$srcdir/linux-unpacked" "$pkgdir/usr/lib/$_srcname"
  ln -sf "/usr/lib/$_srcname/$_srcname" "$pkgdir/usr/bin/$_srcname"
  ln -sf "/usr/lib/$_srcname/resources/app.asar.unpacked/bin/vcashd-x64" "$pkgdir/usr/bin/vcashd"
}
