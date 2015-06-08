# Maintainer: Igor Dejanovic <igor.dejanovic (at) gmail.com>
# Contributor: Igor Dejanovic <igor.dejanovic (at) gmail.com>

pkgname=eclipse-mercurial
pkgver=2.1.0
_pkgver=201304290948
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Eclipse plugin for Mercurial Version Control System"
license=('EPL')
url="https://code.google.com/a/eclipselabs.org/p/mercurialeclipse/"
depends=('eclipse>=3.4' 'mercurial')
source=("http://mercurialeclipse.eclipselabs.org.codespot.com/files/com.vectrace.MercurialEclipse_$pkgver.$_pkgver.jar"
    "http://mercurialeclipse.eclipselabs.org.codespot.com/hg.wiki/update_site/stable/features/mercurialeclipse_$pkgver.$_pkgver.jar")
noextract=("com.vectrace.MercurialEclipse_$pkgver.$_pkgver.jar"
       "mercurialeclipse_$pkgver.$_pkgver.jar")
         
package() {
    install_dir=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
    mkdir -p $install_dir/{features,plugins}

    install -m644 ${srcdir}/mercurialeclipse_$pkgver.$_pkgver.jar $install_dir/features/ || return 1
    install -m644 ${srcdir}/com.vectrace.MercurialEclipse_$pkgver.$_pkgver.jar $install_dir/plugins/ || return 1    
}

md5sums=('e66b2600a005eb3c7649bd0686bd06f8'
         'cceb9b7d523c38c1d2a0317a9f1a28b4')
