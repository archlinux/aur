pkgname=ayaanfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="AYAANFETCH by AYAAN511 – The Only Fetch Tool You’ll Ever Need (Wine, auto-grabs latest .zip)"
arch=('any')
url="https://github.com/ayaan511/ayaanfetch"
license=('MIT')
depends=('wine' 'unzip')
source=(
  "ayaanfetch-latest.zip::https://github.com/ayaan511/ayaanfetch/releases/latest/download/ayaanfetch.zip"
  'install.sh'
)
md5sums=('SKIP' 'SKIP')

prepare() {
    unzip -o "$srcdir/ayaanfetch-latest.zip" -d "$srcdir"
}

package() {
    # Make main directory
    install -d "$pkgdir/usr/bin/unstable/ayaanfetch"
    # Install main exe
    install -Dm755 "$srcdir/AyaanFetch.exe" "$pkgdir/usr/bin/unstable/ayaanfetch/AyaanFetch.exe"
    # Install OpenHardwareMonitor folder and exe
    install -d "$pkgdir/usr/bin/unstable/ayaanfetch/OpenHardwareMonitor"
    install -Dm755 "$srcdir/OpenHardwareMonitor/OpenHardwareMonitor.exe" "$pkgdir/usr/bin/unstable/ayaanfetch/OpenHardwareMonitor/OpenHardwareMonitor.exe"
    # Install the setup script
    install -Dm755 "$srcdir/install.sh" "$pkgdir/usr/bin/ayaan-unstable-setup"
}
