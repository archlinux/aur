# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-aux
pkgver=1.3
pkgrel=1
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
https://raw.github.com/Sophist-UK/Picard-Plugins/master/abbreviate_artistsort.py
https://raw.github.com/Sophist-UK/Picard-Plugins/master/copy_to_comment.py
https://raw.github.com/Sophist-UK/Picard-Plugins/master/musicbee_compatibility.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/zh_cn_convert.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/zh_wiki.py
https://raw.githubusercontent.com/alswl/musicbrainz_picard_zh_cn_convert_plugin/master/langconv.py
)
md5sums=('a0a8800a0dc978bc38cc7fa05044575e'
         '1b9f145664fb74021e85aeaf13aff057'
         '1219e450a0eb04d78a5fb1c36ddd45e5'
         '05c7dbe8f0ff5fc8e634da7db7f700c7'
         'deb3dcba323915f6e18de8904c7d3cd8'
         'c9099bde340ae51d5d2cb908a8ffff24'
         '921a0ba1b5659470f907e2cfc2f72694'
         'c53be179a061dc97f56e00fea9b14bd2'
         '03db4455bdb92fd1bf5fdad3f99b9103'
         'c4be2eceee00f72fc5c4e848d965b2ea'
         'db4100901c9b583140e8fe81bb4d324f'
         '3f4dad9583c7a5d935d009069c599a51'
         '3ec10ede17cf40baf244f3f0e56aceac'
         '51b8537cae78fb372fb229345d8f65dc'
         '29305044b2ae41478647a72ce774bd51'
         '6c4d4f24541b90a6dffb53eec513d6c1'
         'd66e3f114cff82e95458be486db73198'
         '947a93e1595344ac4914509e9307f91c')

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "$srcdir"
  install -d "$plugindir"
  install -m644 -t "$plugindir" \
    padded.py keep.py \
    titlesort.py titleversion.py \
    f2k_rgscan.py metaflac_rgscan.py sidecar.py \
    removeperfectalbums.py autosave.py \
    eq2.py ne2.py p.py \
    abbreviate_artistsort.py copy_to_comment.py \
    musicbee_compatibility.py

  install -Dm644 zh_cn_convert.py "$plugindir"/zh_cn_convert/__init__.py
  install -m644 -t "$plugindir"/zh_cn_convert zh_wiki.py langconv.py
}

# vim:set ts=2 sw=2 et:
