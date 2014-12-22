# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-aux
pkgver=1.3
pkgrel=3
pkgdesc="additional plugins for MusicBrainz Picard"
arch=('any')
url="http://musicbrainz.org/doc/MusicBrainz_Picard/Plugins"
license=('GPL')
depends=('picard')
optdepends=('flac:        for metaflac ReplayGain'
            'foobar2000:  for foobar ReplayGain')
conflicts=('picard-plugins<1.1')
# removed due to crashes:
#https://raw.github.com/mineo/mbstuff/master/picard/plugins/cue.py
# previous location (only temporarily offline?)
#http://kalou.net/unix/picard/metaflac_rgscan.py
source=(
https://raw.github.com/mineo/mbstuff/master/picard/plugins/padded.py
https://raw.github.com/mineo/mbstuff/master/picard/plugins/keep.py
https://raw.github.com/voiceinsideyou/creaps-picard-plugins/master/titlesort.py
https://raw.github.com/voiceinsideyou/creaps-picard-plugins/master/titleversion.py
https://raw.github.com/weisslj/picardplugins/master/f2k_rgscan.py
http://kraehen.org/mb/metaflac_rgscan.py
http://sites.google.com/site/tonyflaks/sidecar.py
https://raw.github.com/voiceinsideyou/picard/plugins/contrib/plugins/removeperfectalbums.py
https://raw.github.com/encukou/picard-plugins/master/autosave.py
https://raw.github.com/brianfreud/Picard-plugins/master/eq2.py
https://raw.github.com/brianfreud/Picard-plugins/master/ne2.py
https://raw.github.com/brianfreud/Picard-plugins/master/p.py
https://raw.githubusercontent.com/Sophist-UK/sophist-picard-plugins/master/copy_to_comment.py
https://raw.githubusercontent.com/Sophist-UK/sophist-picard-plugins/master/musicbee_compatibility.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/zh_cn_convert.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/zh_wiki.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/langconv.py
)
sha256sums=('cdc233c8c3f656394762656d3cf602232154686e593168fecbb9bb033c5f29bb'
            '0ea27833fbce95b1205c1aeba5f3d55758349bfb43ebc19c1987ee47c5dbe522'
            'edee52bc7ca1cf4fb017b02889328a089380b27943255ae31ccc1ece9ef9b853'
            '1885a5876e30b30197a3a9ddb34ffac8cd4458803038468b12fb8801efa91dd1'
            '6492413a9b60b2f3fcccaff8f0a4cb10eb0b97e5d94363c8c34e207c721a4fa9'
            'a0bfe0ac40e006563e28ba6c9f5cd40d256b40e85a757444c7cd9d708c5322a6'
            '8cc8720cb8e9688f9969a9d2484bafa90c9ecc8f05ebb89cb9f4da26573a99f0'
            '3587bd0697a951a97717aa9ce36b44b1d6426cf4a001d18c8629d5d2dbd6ff01'
            '0fcb0d3539f3643ab2914bc93b14b3055c32c383706b1356019315577f4f643f'
            '1ba9cf6a65fa762469d9f0ca5e514e5131b2f4433b57cb71df176ace11852d48'
            '6a768ef7662264509d6f8da783f24b18fa6f80e8d8c18ab53ec3835af7e5d206'
            '5d17af00466c10b3fe2b68e81a540879639295ebaa95511ad2f9cbf0281274e8'
            '25d060e3d20c3045d8f47b53e259648ea02a2acc5a2d25aeade924b540baa098'
            '48d42b952a540c139bcb73f3fe6445947be49975a20381d71b0d62115237ed19'
            'f6958df0fdaffdb8a646ee9a9c624a19116f9fdd2a56df22317fcae2c18da38a'
            '417c19db3ad60f33369b181d266928f76c3421a6aef90eb11c38238f2d3f1a05'
            '3dc557b35d349883677d6aad72600c50eae36abb327f9b741c8332a9df3d0f22')

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "$srcdir"
  install -d "$plugindir"
  install -m644 -t "$plugindir" \
    padded.py keep.py \
    titlesort.py titleversion.py \
    f2k_rgscan.py metaflac_rgscan.py sidecar.py \
    removeperfectalbums.py autosave.py \
    eq2.py ne2.py p.py copy_to_comment.py \
    musicbee_compatibility.py

  install -Dm644 zh_cn_convert.py "$plugindir"/zh_cn_convert/__init__.py
  install -m644 -t "$plugindir"/zh_cn_convert zh_wiki.py langconv.py
}

# vim:set ts=2 sw=2 et:
