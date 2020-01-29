# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname='yandex-disk'
pkgver=0.1.5.1039
pkgrel=2
pkgdesc='Yandex.Disk keeps your files with you at all times.'
arch=('x86_64')
url='http://disk.yandex.ru/'
license=('custom')
depends=('glibc' 'gcc' 'gcc-libs' 'zlib')
install=yandex-disk.install
source=("https://repo.yandex.ru/yandex-disk/deb/pool/main/y/yandex-disk/yandex-disk_${pkgver}_amd64.deb"
        "yandex-disk.install"
        "yandex-disk.service")
md5sums=('540bfce5526c1f761c44039a01edca6a'
         '5ad775bd895526c6b1f335c6d71dbdfa'
         '3d0370f3dfadf9da294b91441c226547')

package() {
	cd $srcdir
	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
	install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
