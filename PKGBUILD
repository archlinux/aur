# Maintainer: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=ttf-droid-simple
pkgver=2012.10.17
pkgrel=5
pkgdesc="General-purpose fonts released by Google as part of Android"
arch=('any')
license=('Apache')
url='http://www.droidfonts.com/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font' 'ttf-droid')
conflicts=('ttf-droid')
source=('https://sources.archlinux.org/other/community/ttf-droid/ttf-droid-20121017.tar.xz'
	'serif-fontconfig.conf' 'sans-fontconfig.conf' 'sans-mono-fontconfig.conf')
sha256sums=('f068efec9e8201fe0d1be75b1a4751c98d14dc44267b2237f549403b2a8069e3'
            '311c79e55fc58e83f066377393e59865518dcbe09b51e5fe3459b69fbac3b6af'
            '93a0dc8e3258be4fafa68df120add114018bb723af7c0d61b60c6d908fcd87b2'
            '42da7d1ac6d7055971c8b1bb98a83e893fbed621534b04247a5f6ed89ca14d44')

package()
{
        # Install fonts
        cd $srcdir/google-droid-fonts-20121017
        install -d $pkgdir/usr/share/fonts/TTF/ 
        install -m644 DroidSans.ttf $pkgdir/usr/share/fonts/TTF/
        install -m644 DroidSans-Bold.ttf $pkgdir/usr/share/fonts/TTF/
        install -m644 DroidSansMono.ttf $pkgdir/usr/share/fonts/TTF/
        install -m644 DroidSerif-*.ttf $pkgdir/usr/share/fonts/TTF/

        # Install fontconfig
        cd $srcdir
        install -d $pkgdir/etc/fonts/conf.avail/
        install -m644 sans-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-sans-fontconfig.conf
        install -m644 sans-mono-fontconfig.conf $pkgdir/etc/fonts/conf.avail/60-$pkgname-sans-mono-fontconfig.conf
        install -m644 serif-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-serif-fontconfig.conf
}

