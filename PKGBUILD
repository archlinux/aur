# Maintainer: Norbert <sandwich@archworks.co>

pkgname=sshlog-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="SSH Session Monitoring Daemon (.deb build)."
arch=('x86_64' 'aarch64')
url="https://www.sshlog.com/"
license=('RSALv2')
depends=('openssh')
source_x86_64=("https://github.com/sshlog/agent/releases/download/v${pkgver}/sshlog_${pkgver}_amd64.deb")
sha256sums_x86_64=('d4326879928e9c22e16eaa488fe2e786adb59c378a93af83505f3a96eda07e85')
sha256sums_aarch64=('e7ee8c4d58adfb58af167663185d70e2f064eb27e1be3c18aea951a8184ac355')
source_aarch64=("https://github.com/sshlog/agent/releases/download/v${pkgver}/sshlog_${pkgver}_arm64.deb")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # Move the contents of 'lib' to '/usr/lib'
  cp -r "$pkgdir/lib" "$pkgdir/usr/"

  # Remove the now-empty 'lib' directory
  rm -r "$pkgdir/lib"
}
