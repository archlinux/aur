#! /bin/bash
#Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=kopete-history-merger
_basedir=kopete_history
pkgver=0.1
pkgrel=4
pkgdesc="Frontend to merge kopete histories from different computers"
arch=('any')
url="https://github.com/azat/${_basedir}"
license=('MIT')
depends=('kdenetwork-kopete' 'qt4')
source=(https://github.com/azat/${_basedir}/archive/master.zip)
sha512sums=('be0fc19dceb257d6e7c02b9e97494d1a473c65ed7708242d50751d4a9aa9a76a56e426a5408202eb4784a9f990b3db2ae1ae8864e5098a987e818f29e60dbaf9')

build() {

cd ${srcdir}/${_basedir}-master
  qmake-qt4 || return 1
  make || return 1
  }

package() {

install -d -m755 ${pkgdir}/usr/lib/kopete_history/{src,forms}
install -d -m755 ${pkgdir}/usr/bin
install -m755 ${srcdir}/kopete_history-master/kopete_history.pro ${pkgdir}/usr/lib/kopete_history/kopete_history.pro
install -m755 ${srcdir}/kopete_history-master/main.o ${pkgdir}/usr/lib/kopete_history/main.o
install -m755 ${srcdir}/kopete_history-master/mainwindow.o ${pkgdir}/usr/lib/kopete_history/mainwindow.o
install -m755 ${srcdir}/kopete_history-master/merger.o ${pkgdir}/usr/lib/kopete_history/merger.o
install -m755 ${srcdir}/kopete_history-master/moc_mainwindow.cpp ${pkgdir}/usr/lib/kopete_history/moc_mainwindow.cpp
install -m755 ${srcdir}/kopete_history-master/moc_mainwindow.o ${pkgdir}/usr/lib/kopete_history/moc_mainwindow.o
install -m755 ${srcdir}/kopete_history-master/moc_merger.cpp ${pkgdir}/usr/lib/kopete_history/moc_merger.cpp
install -m755 ${srcdir}/kopete_history-master/moc_merger.o ${pkgdir}/usr/lib/kopete_history/moc_merger.o
install -m755 ${srcdir}/kopete_history-master/testmerger.moc ${pkgdir}/usr/lib/kopete_history/testmerger.moc
install -m755 ${srcdir}/kopete_history-master/testmerger.o ${pkgdir}/usr/lib/kopete_history/testmerger.o
install -m755 ${srcdir}/kopete_history-master/ui_mainwindow.h ${pkgdir}/usr/lib/kopete_history/ui_mainwindow.h
install -m755 ${srcdir}/kopete_history-master/src/* ${pkgdir}/usr/lib/kopete_history/src/
install -m755 ${srcdir}/kopete_history-master/forms/* ${pkgdir}/usr/lib/kopete_history/forms/
install -m755 ${srcdir}/kopete_history-master/kopete_history ${pkgdir}/usr/bin/kopete_history  
}
  
# vim:set ts=2 sw=2 et: