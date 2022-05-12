# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('596dbcde5bbf56f55dd8701faa6a5173feaafd3dfc74bbe043cca6bebd8019aa20f2511db5142b1de71a5480b37be7077648836fc1e74c1dbf6275a985029f6e')


package() {
  install -dm 755 "$pkgdir/usr/bin/"

  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}

