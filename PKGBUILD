pkgname=ayaanfetch
pkgver=1.0.4
pkgrel=1
pkgdesc="AYAANFETCH by AYAAN511 – The Only Fetch Tool You’ll Ever Need (Wine, always grabs latest .zip release)"
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
    # Copy main EXE
    install -Dm755 "$srcdir/AyaanFetch.exe" "$pkgdir/usr/bin/unstable/ayaanfetch/AyaanFetch.exe"
    # Copy the ENTIRE OpenHardwareMonitor folder with all files/subfolders
    cp -r "$srcdir/OpenHardwareMonitor" "$pkgdir/usr/bin/unstable/ayaanfetch/"
    # Install the setup script as ayaanfetch-setup
    install -Dm755 "$srcdir/install.sh" "$pkgdir/usr/bin/ayaanfetch-setup"
}
