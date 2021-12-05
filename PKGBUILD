# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.1.5
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
license=('MIT')
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'openssl-1.0' 'icu')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install

sha256sums=('79f4dd72bc66ed779da22c0a561de0b0cf341201fc970930d9da9144c2824559')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${pkgver}/powershell_${pkgver}-1.ubuntu.18.04_amd64.deb")

package() {
  tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/share/"
  rm -r "${pkgdir}/usr/local"
  install -Dm644 "$pkgdir/opt/microsoft/powershell/7/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
