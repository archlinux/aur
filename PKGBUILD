# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=openssh-dotconfig-bin
pkgver=9.3p1
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN - with Support for the XDG Base Directory Specification (binary version)"
pkgdesc='Premier connectivity tool for remote login with the SSH protocol - but moved $HOME/.ssh to $HOME/.config/ssh (binary version)'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=(x86_64)
depends=(libnm libsecret openvpn)
depends=('glibc' 'krb5' 'openssl' 'libedit' 'ldns' 'libxcrypt' 'libcrypt.so' 'zlib' 'pam')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X'
            'libfido2: FIDO/U2F support')
source=("https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('41f2673e121b7dadd3674db657c7142abadf6d8274402c336cac2d3ee2ac83d2')
provides=('openssh')
conflicts=('openssh')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
    cp -R "${srcdir}/var/" "${pkgdir}/var"
    cp -R "${srcdir}/etc/" "${pkgdir}/etc"
}
