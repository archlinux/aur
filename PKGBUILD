# Maintainer: Dmitry Kozlyuk <dmitry.kozliuk@gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=sciter-notes-bin
pkgver=4.3.0.9
pkgrel=2
pkgdesc='Evernote-like app based on Sciter SDK'
arch=(x86_64)
url='https://notes.sciter.com'
license=(BSD)
depends=(gtk3)
provides=(sciter-notes)
source=("$pkgname-$pkgver.tgz::https://notes.sciter.com/distributions/sciter-notes-x64.tar.gz"
        'https://gitlab.com/sciter-engine/sciter-js-sdk/-/raw/main/LICENSE'
        'sciter-notes.desktop')
b2sums=('6a7be4630398ad3adf4c3d7b01747e5cebc096799c5839db81936819aebb21652ed4baafa6e4d10799ff969334c71e241ef3f56d9cd15f6fe68da15505c1f03f'
        '53fce109be23349b6960f038f0bb8ca236a13e728eb2f0ed049d5d5db2adaa5fcab45bd02b4fc8aba17c25195b4f913bb39229de89acf9258ef70f6e7dc7d2a0'
        'acb1b7a94324a8b3893196f333fa68f8892b53019571b07b7ac7a3d111289772e812055e733ce51c11b5bdbaae3d89427410e5ae349d55422b8abac691c6e32c')
options=(!strip)

package() {
    install -m 0755 "$srcdir/sciter-notes" -D -T "$pkgdir/usr/bin/sciter-notes"
    install -m 0644 "$srcdir/LICENSE" -D -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications" sciter-notes.desktop
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD: et:
