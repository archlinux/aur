# Maintainer: zhuxiaoxi mailto:<echo emh1eGlhb3hpMTIzNDU2N0B5ZWFoLm5ldAo= | base64 -d>
pkgname=vimcdoc
pkgver=2.1.0
pkgrel=1
pkgdesc="Vim chinese documentation"
arch=(any)
depends=('vim')
url="http://vimcdoc.sf.net"
license=('GPL')
source=("https://jaist.dl.sourceforge.net/project/vimcdoc/vimcdoc/vimcdoc-2.1.0.tar.gz")
md5sums=('e6320d3796afaafa604bf7e9e622727b')
package() {
	cd "${pkgname}-${pkgver}"
	local _dir="${pkgdir}/usr/share/vim/vimfiles"
	for __dir in *; do
		if [ -d "${__dir}" ]; then
			cd ${__dir}
			for __file in *; do
				if [ -f "${__file}" ]; then
					install -Dm 644 ${__file} ${_dir}/${__dir}/${__file}
				fi
			done
			cd ..
		fi
	done
}
