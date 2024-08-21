# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=noipconf
pkgver=0.0.1
pkgrel=1
pkgdesc="NoIP Manager: A simple tool to manage No-IP dynamic DNS configurations."
arch=('x86_64')
url="https://github.com/felipealfonsog/NoIP-Manager"
license=('BSD-3-Clause')
depends=('bash' 'noip')

source=("https://github.com/felipealfonsog/NoIP-Manager/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('76e5f742f3e737b580cea52c6dd97df2e4d94a59eb9b410dad1c35306fffb3ec') # the actual checksum

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the noip-admin.sh script
  install -Dm755 "$srcdir"/NoIP-Manager-v."${pkgver}"/src/noip-admin.sh "${pkgdir}/usr/local/bin/noip-admin"
  
  # Install the installer script (if needed)
  #install -Dm755 "$srcdir"/NoIP-Manager-v."${pkgver}"/installer.sh "${pkgdir}/usr/local/bin/noipconf-installer"

  # Optionally, you can install the uninstaller as well
  # install -Dm755 "$srcdir"/NoIP-Manager-v."${pkgver}"/uninstaller.sh "${pkgdir}/usr/local/bin/noipconf-uninstaller"
}


