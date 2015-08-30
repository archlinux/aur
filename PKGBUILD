# Maintainer: Maximilian Berger <snowdragon92[at]gmail[dotcom]>

pkgname=jarversion
pkgver=1.0
pkgrel=1
pkgdesc="Simple tool that reads the Implementation-Version attribute of a jar file."
arch='any'
url="https://github.com/git-commit/jarversion"
license=('Apache')

depends=('java-runtime')
provides=('jarversion')

source=('jarversion'
		'jarversion.jar')

md5sums=('b9101994eae9bc66d20dd4cba5f85dff'
         '8a5b36291fbc385fab5394b59ece5e1b') #generated with 'makepkg -g'

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/share/java/jarversion/"
    chmod -R 777 "${pkgdir}/usr/share/java/jarversion/"

    # install shell wrapper script
    install -D -m755 "${srcdir}/jarversion"  "${pkgdir}/usr/bin/jarversion"

    # install jar
    install -D -m666 "${srcdir}/jarversion.jar"  "${pkgdir}/usr/share/java/jarversion/jarversion.jar"

}
