# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
pkgname=mutt_oauth2.py
pkgver=20200807
_muttver=2.3.1 # mutt_oauth2.py is versioned separately (see comment on top of it's source). Thus the mutt version is pinned
pkgrel=1
pkgdesc="mutt OAuth2 token management script"
arch=('any')
url="https://gitlab.com/muttmua/mutt/-/blob/master/contrib/mutt_oauth2.py"
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('python>=3.7.3')
source=("git+https://gitlab.com/muttmua/mutt.git#tag=mutt-${_muttver//./-}-rel?signed")
b2sums=('c1cdd47edfe03b3313f0da8e686c8afaaeb41fb3b93ff3660bf88d2517a78178cc36680430065e98e2bc5d7a13032a0d1d1eb042e07385186194aa923f0ed2fa')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

package()
{
    cd mutt/contrib
    install -D -m755 mutt_oauth2.py "${pkgdir}/usr/bin/${pkgname%.-git}"
    install -D -m644 mutt_oauth2.py.README -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
