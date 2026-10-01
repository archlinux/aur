# Maintainer: numb747 <191746905+numb747@users.noreply.github.com>

pkgname=jmcomic-qt
pkgver=1.3.6
_tag=v1.3.6-linux.1
pkgrel=1
pkgdesc="禁漫天堂PC客户端 (PySide6) - JMComic comic browser"
arch=('x86_64' 'aarch64')
url="https://github.com/numb747/JMComic-qt"
license=('LGPL-3.0-only' 'MIT')
depends=(
  'pyside6'
  'python'
  'python-beautifulsoup4'
  'python-certifi'
  'python-cffi'
  'python-cryptography'
  'python-dateutil'
  'python-lxml'
  'python-natsort'
  'python-pillow'
  'python-pyasn1'
  'python-pycryptodome'
  'python-pycryptodomex'
  'python-pysocks'
  'python-requests'
  'python-tqdm'
  'python-yaml'
  'qt6-imageformats'
  'qt6-svg'
)
makedepends=('python-pip' 'qt6-base')
optdepends=('qt6-wayland: 原生Wayland支持')
optdepends_x86_64=('vulkan-icd-loader: 超分辨率(Waifu2x)GPU加速'
                   'vulkan-driver: 超分辨率(Waifu2x)GPU加速')
# 预编译的wheel(curl_cffi自带libcurl-impersonate), 不要strip
options=('!strip' '!debug')

# 官方仓库中没有的Python依赖, 以wheel形式打包进私有目录
_pypi=https://files.pythonhosted.org/packages
_wheels=(
  "$_pypi/f7/36/25aae4004cf9499284cc058c036418583b6155ae7b81631e499517d0727b/jmcomic-2.6.20-py3-none-any.whl"
  "$_pypi/0c/06/bb7fd47d02b7fc75c7faeba7d1366ca373a31e5b85c194acbebb8296a258/commonx-0.6.40-py3-none-any.whl"
  "$_pypi/89/5e/0b1c2f494d03c4acbc44567fa68b954cd0fa3f21eb3f9528011da371f9b1/webdavclient3-3.14.7-py3-none-any.whl"
  "$_pypi/12/4a/5683a2244e7d8235612217936b33cd1ccded87371606afe4436b09cdc0b3/pysmb-1.2.15-py3-none-any.whl"
  "$_pypi/76/d3/250e13e7b3473a0f441f4d680d511ad30ce432d0180115dec9840d88fe89/smbprotocol-1.17.0-py3-none-any.whl"
  "$_pypi/93/fd/0e09467d5b8e229388c897126b4aed1e5fef2295a8661e2cad21fa9a8214/pyspnego-0.12.3-py3-none-any.whl"
)
_wheels_x86_64=(
  "$_pypi/3c/8a/0486bdd2a8c1ee03288f19defc6d0270b81f8132e22f7197101ba64f55aa/curl_cffi-0.16.1-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
  "$_pypi/2f/bf/8da6f4f37cc9ad76a46a9722c5dc5ca8d3061e8471ece5a9488088037cee/sr_vulkan-2.0.1.1-cp37-abi3-manylinux_2_17_x86_64.whl"
  "$_pypi/75/cb/aefb05235c68b8a72444779d56505a5047692f2c13c497e8131c8f710f29/sr_vulkan_model_waifu2x-1.0.1-py3-none-any.whl"
  "$_pypi/d5/80/6b93121f57518acbb0302159611fe98601920b8afff95b4ea277c7b21e21/sr_vulkan_model_realcugan-1.0.1-py3-none-any.whl"
  "$_pypi/17/e0/8785f5833b06feb585634df9152450fd0272df12be001e34729f54f39ab6/sr_vulkan_model_realesrgan-1.0.1-py3-none-any.whl"
)
_wheels_aarch64=(
  "$_pypi/e9/de/b7fc6c664cf5d379a70918decba8ec09afdebd8f3de822e42bcb64af2c7a/curl_cffi-0.16.1-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl"
)

source=("$pkgname-$_tag.tar.gz::https://github.com/numb747/JMComic-qt/archive/refs/tags/$_tag.tar.gz"
        "${_wheels[@]}")
source_x86_64=("${_wheels_x86_64[@]}")
source_aarch64=("${_wheels_aarch64[@]}")
noextract=("${_wheels[@]##*/}" "${_wheels_x86_64[@]##*/}" "${_wheels_aarch64[@]##*/}")
sha256sums=('32afa9fe42598b645de265985ec514444e84627f8a6277383c53952518bd6b66'
            '5319686bd7790f769294d0f4ad5cc17081a97e6e892c8a6ad333a20cf2ab085e'
            'cb5c16a955848d82289e08ec121b4ec86775b22c75c65584f15cc45f86e85510'
            'a904381da8e3ae77b4ca9e11e05058d91a07704254d71c193c797f7c2fb15025'
            'f8459400dfcc9f1ec691936fc57d794803c4240516c27cb196024333f4947d7a'
            'bd1abff5417f5af83ca516a64ab8e5acece3dbdcf58d4e5e23e47f5165a77349'
            '39b87aa00491e554cef05441bf2f7e52e85b09b5229ff62a89c35b59548794be')
sha256sums_x86_64=('793d79c61ad4f8b0aeb9fd13afa58ff38a48110946b781e257013f8ffe3501dc'
                   'a00fa688fd74211a187b00fa83f05ac6ad65ec9e884263618f06eaf93597d383'
                   '64b535fc96ff392825535915ef3f03e4820b8c18aace861aa0d9b49b0628634b'
                   'afb402627d83231e642b8803dc084565e1d8c54e7fa08af92486543032ce75d9'
                   '41bcd2ad4971842deb63320561281a5b426ed23120f8d30e554b9232ebf04402')
sha256sums_aarch64=('1bc9f913212d9e13499dde43b6527fa3613f3846035ea9c5b05ca24be1153a75')

build() {
  cd "JMComic-qt-${_tag#v}"
  /usr/lib/qt6/rcc -g python -o src/images_rc.py res/images.qrc

  local _whl=() _f
  for _f in "${noextract[@]}"; do
    [[ -f "$srcdir/$_f" ]] && _whl+=("$srcdir/$_f")
  done
  rm -rf "$srcdir/site-packages"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --no-index --no-deps \
    --no-compile --disable-pip-version-check --target "$srcdir/site-packages" "${_whl[@]}"
  rm -rf "$srcdir/site-packages/bin"
  rm -f "$srcdir"/site-packages/*.dist-info/direct_url.json
}

package() {
  cd "JMComic-qt-${_tag#v}"

  install -d "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/lib/$pkgname"
  cp -r src/. "$pkgdir/usr/share/$pkgname/"
  rm -f "$pkgdir/usr/share/$pkgname"/requirements*.txt
  cp -r "$srcdir/site-packages" "$pkgdir/usr/lib/$pkgname/site-packages"

  python -m compileall -q -f -j0 -d "/usr/share/$pkgname" "$pkgdir/usr/share/$pkgname" 2>/dev/null
  python -m compileall -q -f -j0 -d "/usr/lib/$pkgname/site-packages" "$pkgdir/usr/lib/$pkgname/site-packages"

  install -Dm755 res/archlinux/jmcomic-qt.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 res/archlinux/jmcomic-qt.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 res/icon/logo_round.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
