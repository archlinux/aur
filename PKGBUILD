# Maintainer: Max Bruckner
pkgname=lfs-me
pkgver=3.1.3
pkgrel=1
pkgdesc="A simple fakeroot based package manager for LFS inspired by Archlinux."
arch=( 'any' )
url="https://github.com/FSMaxB/lfs-me"
license=('GPL3')
depends=( 'rsync' 'bc' )
optdepends=( 'bash-completion: command completion' )
source=( "git+https://github.com/FSMaxB/${pkgname}.git#tag=$pkgver" )
md5sums=( SKIP )

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm 755 "$pkgname"     "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 PKGBUILD.proto "${pkgdir}/usr/share/${pkgname}/PKGBUILD.proto"
    install -Dm 644 Changelog.md   "${pkgdir}/usr/share/doc/${pkgname}/Changelog.md"
    install -Dm 644 README.md      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 KNOWN_ISSUES   "${pkgdir}/usr/share/doc/${pkgname}/KNOWN_ISSUES"
    install -Dm 644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/lfs-me"
	#TODO install examples
}
