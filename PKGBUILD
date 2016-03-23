# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=else_heart.break-hib
pkgver=2016.03.23
pkgrel=1
pkgdesc="game about friendship, love and technology in a place where bits have replaced atoms. humblebundle version"
url="http://elseheartbreak.com/"
arch=('any')
license=('commercial')
source=(hib://ElseHeartbreakLinux.tgz)
md5sums=('7030450cadac6234676967ae41f2a732')
PKGEXT=.pkg.tar
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
 
package() {
    # copy files
    install -Dm755 "${srcdir}/ElseHeartbreakLinux/ElseHeartbreak" "${pkgdir}/opt/elseheartbreak/ElseHeartbreak"
    cp -R "${srcdir}/ElseHeartbreakLinux/ElseHeartbreak_Data" "${pkgdir}/opt/elseheartbreak/"

    # create starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/elseheartbreak" << \here
#!/usr/bin/bash
cd /opt/elseheartbreak
ElseHeartbreak
here
    chmod a+x "${pkgdir}/usr/bin/elseheartbreak"
}
