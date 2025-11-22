# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=meowrch-tools
pkgver=3.0
pkgrel=1
pkgdesc="Performance optimization tools and scripts for Meowrch distribution"
arch=('any')
url="https://github.com/meowrch/meowrch-tools"
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
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95432aebec9972bf3a483d7dec04a1597aa0ba00b1a5bd44daa52a251aab3a4b')

package() {
    cd "$srcdir/meowrch-tools-$pkgver"
    
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
