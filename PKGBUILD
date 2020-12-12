# Maintainer: Anton Butenko <F48D1.h@gmail.com>

pkgname=goldjack
pkgver=20201210
pkgrel=1.0
pkgdesc='Jackalizer tool'
url='***@aur.archlinux.org:goldjack'
arch=('any')
license=('GPL2')

depends=('python' 'sh' 'python-pillow')
makedepends=('git')

source=('goldjack::git://github.com/F48D1/goldjack.git')
sha512sums=('SKIP')

package() {
  	cd ${pkgname}

  	install -d "${pkgdir}/etc"
  	install -d "${pkgdir}/usr/bin"
  	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/share/doc"

	mv main.py "${pkgdir}/opt/${pkgname}/main.py"

	cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
cd /opt/${pkgname}
python main.py "\$@"
EOF

	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
