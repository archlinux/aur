# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=meowrch-tools
pkgver=2.0.0
pkgrel=1
pkgdesc="Performance optimization tools and scripts for Meowrch distribution"
arch=('any')
url="https://github.com/meowrch/meowrch"
license=('MIT')
depends=('bash' 'systemd' 'coreutils')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'gamemode: for gaming optimizations'
            'mangohud: for gaming performance monitoring'
            'steam: for Steam integration'
            'lutris: for Lutris integration'
            'cpupower: for CPU frequency management'
            'mesa: for OpenGL/Vulkan optimizations with zink-run'
            'power-profiles-daemon: for power profile management')
install=meowrch-tools.install
source=("$url/archive/refs/heads/v3.0.tar.gz")
sha256sums=('0c635fcc72c166a0cf13b7c7be24755ce875b651d48771d84562e92ad239cf82')

package() {
    cd "$srcdir/meowrch-3.0/aur-packages/meowrch-tools"
    
    # Copy organized structure 
    cp -r "usr" "$pkgdir/"
    
    # Make all scripts executable
    chmod +x "$pkgdir/usr/bin/"*
    chmod +x "$pkgdir/usr/bin/core/"*
    chmod +x "$pkgdir/usr/bin/wrappers/"*
    chmod +x "$pkgdir/usr/bin/gaming/"*
    
    # Create directories for user configs
    install -dm755 "$pkgdir/usr/share/meowrch-tools"
    install -dm755 "$pkgdir/etc/meowrch"
}
