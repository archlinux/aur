# Original author: Thomas Sowell <tom@fancydriving.org>
# Maintained by: Semyon Bochkaryov <squizduos@gmail.com>

pkgname=libgestures-bin
pkgdesc="Chromium OS gestures library (binary version)"
pkgver=2.1.14
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/hugegreenbug/libgestures"
license=('custom:chromiumos')
depends=('jsoncpp')
replaces=("libgestures")


source_i686=(
"${pkgname}.deb::https://launchpad.net/~eugenesan/+archive/ubuntu/ppa/+build/9682492/+files/libgestures_2.1.14-1ubuntu2~eugenesan~xenial3_i386.deb"
"${pkgname}-dev.deb::https://launchpad.net/~eugenesan/+archive/ubuntu/ppa/+build/9682492/+files/libgestures-dev_2.1.14-1ubuntu2~eugenesan~xenial3_i386.deb")

source_x86_64=(
"${pkgname}.deb::https://launchpad.net/~eugenesan/+archive/ubuntu/ppa/+build/9682491/+files/libgestures_2.1.14-1ubuntu2~eugenesan~xenial3_amd64.deb"
"${pkgname}-dev.deb::https://launchpad.net/~eugenesan/+archive/ubuntu/ppa/+build/9682491/+files/libgestures-dev_2.1.14-1ubuntu2~eugenesan~xenial3_amd64.deb"
)

noextract=("${pkgname}.deb"
					"${pkgname}-dev.deb")

md5sums_i686=('SKIP'
							'SKIP')
md5sums_x86_64=('SKIP'
								'SKIP')
build() {
		msg2 "Extracting source deb..."	
		mkdir "${srcdir}/source/"
		cd "${srcdir}/source/"
		ar x "${srcdir}/${pkgname}.deb"
		cd "../../"
    
		msg2 "Extracting dev deb..."
		mkdir  "${srcdir}/dev"
		cd "${srcdir}/dev/"		
		ar x "${srcdir}/${pkgname}-dev.deb"
		cd "../"
               
		msg2 "Extract source data.tar.xz..."
		tar xf "${srcdir}/source/data.tar.xz"
    
		msg2 "Extract dev data.tar.xz..."
		tar xf "${srcdir}/dev/data.tar.xz"
                
}

package() {
    msg2 "Install package resources..."
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
