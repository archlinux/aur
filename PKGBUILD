# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=gpgpwd
pkgver=0.7
pkgrel=1
pkgdesc='A command-line password manager based around GnuPG'
arch=('i686' 'x86_64')
url="http://random.zerodogg.org/gpgpwd/"
license=('GPL3')
depends=('perl' 'perl-json' 'perl-try-tiny' 'gnupg')
optdepends=(
    'git: synchronize your passwords between different machines'
    'xclip: copy passwords to the clipboard'
)
source=(http://files.zerodogg.org/$pkgname/$pkgname-$pkgver.tar.bz2{,.sig})
md5sums=('734e5dad91d82ab189d56585a2dbe4a7'
         'SKIP')
validpgpkeys=('4455CC0B4399C855F7143716D76A12A07374A722')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 gpgpwd "${pkgdir}/usr/bin/gpgpwd"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 gpgpwd.1 "${pkgdir}/usr/share/man/man1/gpgpwd.1"
}
