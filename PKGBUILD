# Maintainer: nb5p
pkgname=vimcdoc
pkgver=2.3.0
pkgrel=1
pkgdesc="Vim chinese documentation"
arch=(any)
depends=('vim')
url="http://vimcdoc.sf.net"
license=('GPL')
source=("https://nchc.dl.sourceforge.net/project/vimcdoc/vimcdoc/vimcdoc-2.3.0.tar.gz")
md5sums=('fdc9e9d35a1355423bcc5f75f7f5463c')
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
