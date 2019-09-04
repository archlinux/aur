
###
### maintainer: holger jahn <holger@loomsday.co.nz>
###

pkgname='disklow'
pkgver='1.2'
pkgrel='1'
pkgdesc='Fine grained disk space reporting with emphasis on mail functionality'
arch=('any')
url='https://www.loomsday.co.nz/development?id=linuxutils'
license=(
    'GPL'
    'PerlArtistic'
    )
depends=(
    'perl'
    'perl-filesys-df'
    'perl-config-general'
    'perl-mail-sendmail'
    'perl-net-smtp-ssl'
    'perl-authen-sasl'
    )
optdepends=(
    'msmtp-mta: minimalistic system sendmail command'
    's-nail: minimalistic system mail command'
    'cronie: for periodic disk space monitoring'
    )
backup=(
    'etc/disklow.conf'
    )
source=(
    "https://www.loomsday.co.nz/sources/disklow-$pkgver.tar.gz"
    )
package() {
    cd $pkgname-$pkgver
    install -m0644 -Dt "$pkgdir/etc" disklow.conf
    install -m0755 -Dt "$pkgdir/usr/bin" disklow
    install -m0644 -Dt "$pkgdir/usr/share/doc/disklow" sendmail-setup.txt
    install -m0644 -Dt "$pkgdir/usr/share/man/man1" disklow.1
    }

sha256sums=('05b9f510278147f24b0556eb745ff2b71c98c00fedf33434744fbe76ec884c26')
