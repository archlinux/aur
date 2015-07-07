# Maintainer: Thermi <noel at familie-kuntze dot de>

pkgname=ocfs2-tools
pkgver=1.4.4
pkgrel=1
pkgdesc="ocfs2 tool chain by Oracle, including mkfs, tunefs, fsck, debugfs and utilities for ocfs2"
arch=('x86_64' 'i686')
url="https://oss.oracle.com/projects/ocfs2-tools/"
license=('GPL')
optdepends=('pacemaker' 'corosync')
source=(ocfs2-tools::"https://github.com/Thermi/ocfs2-tools/archive/master.zip")

sha256sums=('SKIP')

build() {
	cd "${srcdir}/ocfs2-tools/"
	./configure	--prefix=/usr	\
		--sysconfdir=/etc 	\
		--libexecdir=/usr/lib	\
		--sbindir=/usr/bib
	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/ocfs2-tools/"
	make DESTDIR=${pkgdir} install 
}
