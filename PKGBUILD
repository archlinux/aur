# Maintainer: dimflix <dimflix.official@gmail.com>
# Updated with automatic SHA256 hash calculation
pkgname=meowrch-settings
pkgver=3.1.3
pkgrel=1
pkgdesc="System optimization settings for Meowrch"
arch=('any')
url="https://github.com/meowrch/meowrch-settings"
license=('MIT')
depends=('systemd' 'zram-generator' 'pipewire' 'earlyoom' 'pciutils' 'systemd' 'cachyos-ananicy-rules' 'ananicy-cpp')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'amd-ucode: for AMD CPU microcode'
            'intel-ucode: for Intel CPU microcode'
            'hdparm: for HDD performance optimizations')
conflicts=('cachyos-settings')
provides=('cachyos-settings')
install=meowrch-settings.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('258dce690a29c7ee659fff82a69d9ce0ff08fbee65e9676de6a511582c3c0dbe')

package() {
    cd "$srcdir/meowrch-settings-$pkgver"
    
    # Copy organized structure
    cp -r "etc" "$pkgdir/"
    cp -r "usr" "$pkgdir/"

    # Ensure scripts are executable
    chmod +x "$pkgdir/usr/bin/meowrch-apply-optimizations"
    chmod +x "$pkgdir/usr/bin/pci-latency"
}
