# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=meowrch-tools
pkgver=2.0.0
pkgrel=13
pkgdesc="Performance optimization tools and scripts for Meowrch distribution"
arch=('any')
url="https://github.com/meowrch/meowrch"
license=('MIT')
depends=('bash' 'systemd' 'coreutils' 'curl' 'jq' 'tar' 'python3')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'gamemode: for gaming optimizations'
            'mangohud: for gaming performance monitoring'
            'steam: for Steam integration'
            'lutris: for Lutris integration'
            'cpupower: for CPU frequency management'
            'mesa: for OpenGL/Vulkan optimizations with zink-run'
            'power-profiles-daemon: for power profile management'
            'less: for migration file preview'
            'sudo: for system updates')
install=meowrch-tools.install
source=("meowrch-tools-2.0.0-13.tar.gz::$url/archive/refs/heads/v3.0.tar.gz")
# Автоматическая замена в workflow
sha256sums=('d76ea0985d68d45d03349bd0f8a2ba87d8ac82966e597e95307d1c55ba8e13dd')

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
