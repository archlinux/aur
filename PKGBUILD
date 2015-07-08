# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname='checkbashisms'
pkgver='20141116'
pkgrel='1'
pkgdesc='Debian script that checks for bashisms'
arch=('any')
url='http://packages.qa.debian.org/d/devscripts.html'
license=('GPL')
depends=('perl')
conflicts=('devscripts')
source=('checkbashisms.1::https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.1?id=ac3f363dba649f1fffa80575b6c8a902dee9d5c0'
        'checkbashisms.pl::https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl?id=b4cd8da5711bf1c182b8688dc181a551592f64b4')
sha256sums=('c74d1ed33fee4cf2ccca0d7690d404d551a4edcbde0ddc602104d9198359cefb'
            'cbe4d4d95f9da6c695be0205926037bbe25875dbae47cd24834e275ebeb58b94')

package() {
  cd "${pkgdir}"
  install -Dm755 "${srcdir}/checkbashisms.pl" 'usr/bin/checkbashisms'
  sed -i -e "s,###VERSION###,${pkgver},g" 'usr/bin/checkbashisms'
  install -Dm644 "${srcdir}/checkbashisms.1" 'usr/share/man/man1/checkbashisms.1'
}
