### Arch_Linux PKGBUILD for lpclic
## Maintainer: B.H. <es_vinux@vinuxproject.org>
pkgname=lpclic
_pkgname=lpclic
pkgver=0.5.1
pkgrel=1
pkgdesc="Optimizes the command history for the linphonec CLI for linphone"
arch=('any')
url="https://github.com/burt1iband/lpclic"
license=('GPL')
source=("git+${url}.git")
depends=('bash' 'bash-completion' 'sed' 'linphone')
provides=('lpclic')
conflicts=('lpclic')
md5sums=('SKIP')

package() {
cd "${srcdir}/${_pkgname}"
     install -d "$pkgdir/usr/bin"
     install -m 755 $_pkgname $pkgdir/usr/bin/
     install -d "$pkgdir/etc/lpclic"
          install -m 644 lpc_favorites "$pkgdir/etc/lpclic/"
          install -m 644 lpc.conf ${pkgdir}/etc/lpclic/
     install -d "$pkgdir/usr/share/bash-completion/"
          cp -r completions ${pkgdir}/usr/share/bash-completion/
     install -d "$pkgdir/usr/share/doc/lpclic"
          install -m 644 change.log ${pkgdir}/usr/share/doc/lpclic
          install -m 644 lpc.conf ${pkgdir}/usr/share/doc/lpclic
          install -m 644 lpc_favorites ${pkgdir}/usr/share/doc/lpclic
          install -m 644 README ${pkgdir}/usr/share/doc/lpclic
     install -d "$pkgdir/usr/share/man/man1"
          install -m 644 lpclic.1.gz $pkgdir/usr/share/man/man1/
}
