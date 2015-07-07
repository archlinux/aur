# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=getlive
_pkgname=GetLive
pkgver=2.4
_pkgver=2_4
pkgrel=1
pkgdesc="Fetches your Hotmail Live mail"
arch=('any')
url="http://sourceforge.net/projects/getlive/"
license=('GPL')
depends=('curl' 'perl-uri' 'perl-net-server' 'procmail')
changelog=getlive.changelog
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${_pkgname}_${_pkgver}.tgz)
md5sums=('124e2c5f4a4b1d7b188b6057afb8697e')

package() {
  cd "$srcdir/${_pkgname}_${_pkgver}"

  mkdir -p $pkgdir/usr/bin/
  install -m755 {GetLive.pl,SmtpForward.pl,SmtpAuthForward.pl} $pkgdir/usr/bin/

  # Mail Notification expects a "GetLive" command in path
  cd $pkgdir/usr/bin/
  ln -s GetLive.pl GetLive
}
