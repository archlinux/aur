# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=openssh-dotconfig-bin
pkgver=9.4p1
pkgrel=3
pkgdesc="NetworkManager VPN plugin for OpenVPN - with Support for the XDG Base Directory Specification (binary version)"
pkgdesc='Premier connectivity tool for remote login with the SSH protocol - but moved $HOME/.ssh to $HOME/.config/ssh (binary version)'
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
arch=(x86_64)
depends=(
  glibc
  krb5 libkrb5.so libgssapi_krb5.so
  ldns
  libedit
  libxcrypt libcrypt.so
  openssl
  pam libpam.so
  zlib
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)
source=("https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('d10ea0f3cb6c9eddd7a8174ccd5470d3944396a30ef427f0a1189df19d5cd2fc')
provides=('openssh')
conflicts=('openssh')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
    cp -R "${srcdir}/var/" "${pkgdir}/var"
    cp -R "${srcdir}/etc/" "${pkgdir}/etc"
}
