pkgname=fzf-tab-source
pkgver=1.0.2
pkgrel=1
pkgdesc="替代zsh的命令补全功能，加入文件和目录预览，可使用rg和rga辅助fzf搜索。
         Replace zsh's default completion selection menu with fzf.Add file and directory previews,and can use rg or rga to assist fzf searches.
         After the installation is completed, use 'fts -a' to enable the plugin"
arch=('x86_64')
url="https://github.com/aslingguang/fzf-tab-source"
license=('GPL')
depends=('zsh' 'fzf')

optdepends=('exa: 目录结构预览'
	'chafa: 图片预览'
	'perl-image-exiftool: 元数据预览'
	'python-pdftotext: pdf预览'
	'bat: 文本预览'
	'python-xlsx2csv: xlsx2csv预览'
	'perl-xls2csv: xls2csv预览'
	'csvkit: xlsx2csv和xls2csv预览'
	'pandoc: docx预览'
	'atool: deb,gz,jar,rpm,tar,tgz,xz,zip等预览 '
	'unrar: rar预览'
	'p7zip: 7z预览'
	'fd: 快速查找文件和目录，比默认的find更快')
source=("https://github.com/aslingguang/fzf-tab-source/releases/download/v1.0.2/fzf-tab-source.tar.gz")
sha256sums=('20e418c7c0c4c7fd0c376a40a0e7740aec417ba1bf1a951133fd5988a1f58cec')

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/fzf-tab-source" "$pkgdir/opt"
	chmod +x -R "$pkgdir/opt/fzf-tab-source"
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/fzf-tab-source/fts.sh" "$pkgdir/usr/bin/fts"
	chmod +x "$pkgdir/usr/bin/fts"
}
