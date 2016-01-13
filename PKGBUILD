# Maintainer: Simon Arjuna Erat (sea), erat.simon@gmail.com
# Contributor: Simon Arjuna Erat (sea), erat.simon@gmail.com
# -----------------------------------------------------------------------
# Copyright (c) 2014-2016 Simon Arjuna Erat (sea)  <erat.simon@gmail.com>
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANT ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# -----------------------------------------------------------------------
# This file represents the 'devel' package from 'master' tree.
#
#	Variables
#
	# Prj info
	_hkgname=tui-master
	pkgname=tui
	pkgdesc="GNU TUI, Text User Interface, framework for scripts"
	license=('GPL-3')
	groups=(core)
	
	# Pkg info
	arch=('any')
	#pkgver=$(tmp=$(\gawk -F= '/TUI_VERSION/ {print $2}' ../../bin/tuirc);echo ${tmp/*=};tmp='')
	pkgver=0.9.4
	pkgrel=1
	
	# Src info
	url="https://savannah.nongnu.org/projects/tui/"
	source=(http://git.savannah.gnu.org/cgit/${pkgname}.git/snapshot/${pkgname}-master.tar.gz)
	#msg2 "Retrieve devel"
	#not_secure="$(md5sum ${source##*/}|awk '{print $1}')"
md5sums=('a1777f8665e68b2f5d835b51d30b4859')
	
	# Bld info
	provides=('tui')
	#msg2 "Checking for dependencies..."
	depends=('bash' 'gawk' 'gettext' 'grep' 'sed')
	#msg2 "Checking for build dependencies..."
	makedepends=('texinfo' 'txt2man')
	
	# Run depends
	depends=(bash,coreutils)
#
#	Functions
#
	#prepare() {
	#	cd src
	#}
	build() {
		cd ${srcdir}/${_hkgname} #-${pkgver}
		#msg2 "Building docs..."
		./configure --prefix=/usr --chroot=$pkgdir
	}
	package() {
		pwd
		ls
		cd ${srcdir}/${_hkgname} #-${pkgver}
		#msg2 "Installing..."
		./make-install-all
		msg2 Done
	}
