# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.7.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Agent for Arch Linux"
arch=('x86_64' 'aarch64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
    'curl'
    'gcc'
    'make'
    'sudo'
    'wget'
    'expect'
    'gnupg'
    'perl-base'
    'perl'
    'fakeroot'
    'python'
    'brotli'
    'automake'
    'autoconf'
    'libtool'
    'gawk'
    'libsigsegv'
    'nodejs'
    'base-devel'
    'inetutils'
    'cmake'
);
optdepends=(
    'lsb-release'
);
validpgpkeys=('9E646BB0630C8FD18ACD15541B93E6A766CD229D')

source_aarch64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm")
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm")

sha256sums_x86_64=('af3ef12d1105f4191b68497d9d0dbfe7c35279ed6162c99c757b8bf3f85d7a31')
sha256sums_aarch64=('cfc27b8b0daa3a46898928f4ee19d58bd0c1cb56d561b5f7d8b56d4615ed0e71')

install=$pkgname.install

package() {
    #change permissions
    chmod -R +w "$srcdir/var/ossec"
    #Setup
    cd $pkgdir
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/var .
    #Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-agent.service
    
}
