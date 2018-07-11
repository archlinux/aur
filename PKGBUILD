# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=alchemy
pkgver=0.0.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Nonorthodox painting software experimenting with alternative ways of drawing"
url="http://al.chemy.org/"
license=('GPL')
conflicts=('alchemy-svn')
depends=('sh' 'java-environment' 'hicolor-icon-theme')
makedepends=('imagemagick')
source=("http://al.chemy.org/files/Alchemy-008.tar.gz"
	"alchemy.desktop"
	)
md5sums=('c900de439c3c2faf9abe17b6f6a55720'
         'c7cffede4dda0acd94aa94deec037720')

package() {
	install -dm755 ${pkgdir}/opt/alchemy
        cp -r -t ${pkgdir}/opt/alchemy Alchemy/*
	install -dm755 ${pkgdir}/usr/bin
	echo -e "#!/bin/sh\nexec /opt/alchemy/Alchemy" > ${pkgdir}/usr/bin/alchemy
	echo -e "#!/bin/sh\nexec /opt/alchemy/AlchemyOpenGL" > ${pkgdir}/usr/bin/alchemy-opengl
	chmod +x ${pkgdir}/usr/bin/*
	jar xvf Alchemy/Alchemy.jar org/alchemy/data/alchemy-logo64.png
	install -Dm644 "org/alchemy/data/alchemy-logo64.png" "${pkgdir}/usr/share/pixmaps/alchemy.png"
	install -Dm644 "org/alchemy/data/alchemy-logo64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/alchemy.png"
	install -Dm644 "alchemy.desktop" "${pkgdir}/usr/share/applications/alchemy.desktop"
}
