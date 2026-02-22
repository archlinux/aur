# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
# Contributor: Junfeng Qiao <qiaojunfeng at outlook.com>

# This PKGBUILD helps you install FangZheng GBK fonts for Chinese. 

pkgname=ttf-fangzheng
pkgdesc="FangZheng GBK fonts;方正字体"
pkgver=20170101
pkgrel=1
arch=(any)
url='https://www.foundertype.com/heji_i/42.html'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-fangzheng)

_ttf_fangzheng=(
#########################################################################################
#文件名          字体名          编码         字体格式  字数   版本号 更新时间
#########################################################################################
fangzhengfangsong_gbk.ttf # 方正仿宋_GBK    GBK          TTF     21003  5.30   2015-09-02  
fangzhengkaiti_gbk.ttf    # 方正楷体_GBK    GBK          TTF     21003  5.30   2015-09-02  
FZSSK.TTF      # 方正书宋_GBK    GBK          TTF     21003  5.30   2015-09-02  
FZHTK.TTF      # 方正黑体_GBK    GBK          TTF     21003  5.30   2015-09-02  
)

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 -o %o %u")
source=("https://imgcdn.umiwi.com/ttf/fangzhengfangsong_gbk.ttf"
	"https://imgcdn.umiwi.com/ttf/fangzhengkaiti_gbk.ttf"
	"https://cdn1.foundertype.com/Public/Uploads/ttf/FZHTK.TTF"
        "https://cdn1.foundertype.com/Public/Uploads/ttf/FZSSK.TTF"
        "license.html::https://www.foundertype.com/index.php/About/bookAuth/key/my_grfs.html")

sha256sums=('ef84cfa29b89f5cb7936306ddec54819d7667fec6d028b820cf80794635c043f'
            '6527f1a53414d9d1dcdb64f7f26cc451ef7ab2c57a2a2b1a06e5255e97f2d894'
            '5be63dbc864f04b012f83db53b2e0ea4a2c70311c4a42cc33c6206ae9cd47ef0'
            '00fdbfb433aaf4c00dd02b79319bbfe94ffca399dba1be9e6455e4bb650e0273'
            'SKIP')

package() {
    install -m755 -d "$pkgdir/usr/share/fonts/fangzheng"
    install -m644 ${_ttf_fangzheng[@]} -t "$pkgdir/usr/share/fonts/fangzheng"
    install -Dm644 license.html "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

