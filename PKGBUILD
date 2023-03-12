# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=openssh-dotconfig-bin
pkgver=9.2p1
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
sha256sums=('ca44d8d22efefbffc3985d08e95ba0345219c23ac324e5546fa6489256b33b17')
provides=('openssh')
conflicts=('openssh')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
    cp -R "${srcdir}/var/" "${pkgdir}/var"
    cp -R "${srcdir}/etc/" "${pkgdir}/etc"
}
